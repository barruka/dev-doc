# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Nodus.Back is a .NET 9.0 backend API for a port/terminal management system handling bills of lading (BLs), container movements, bookings, billing, cash register operations, and ERP integration. The solution uses ASP.NET Core Web API with Entity Framework Core, SQL Server, and MediatR for CQRS-style commands/queries.

## Solution Structure

- **Nodus.Api** - ASP.NET Core Web API entry point with controllers, background services, and middleware
- **Nodus.Application** - Business logic, use cases, domain services, and event handlers
- **Nodus.Contracts** - Shared DTOs, interfaces, enums, and domain events
- **Nodus.Database** - EF Core DbContext, repositories implementing Unit of Work pattern
- **Nodus.Files** - File parsing/generation for EDI formats (BAPLIE, COPARN, etc.)
- **Nodus.Tests** - MSTest unit tests with Moq

## Common Commands

### Build
```bash
dotnet build
```

### Run API
```bash
dotnet run --project Nodus.Api
```

### Run Tests
```bash
dotnet test
```

### Run Single Test
```bash
dotnet test --filter "FullyQualifiedName~YourTestClass.YourTestMethod"
```

### Restore Dependencies
```bash
dotnet restore
```

## Architecture Patterns

### Unit of Work Pattern
- **IUnitOfWork** interface with Repository(), Repository_v2(), ViewRepository(), and FunctionRepository() accessors
- Thread-safe implementation using IServiceScopeFactory instead of direct DbContext injection
- Critical for multi-threaded MediatR event handlers
- Each unit of work creates its own scoped DbContext to prevent concurrency issues
- See `Nodus.Database/UnitOfWork.cs:8-23` for detailed documentation

### Use Cases Pattern
- Business operations organized into "UseCases" records containing related query/command classes
- Example: `ClientUseCases` (Nodus.Application/Clients/_ClientUseCases.cs) groups GetClient, GetClients, GetClientsByIds, etc.
- Each use case is a standalone class with Execute() method accepting UserDto performer and parameters
- Use cases injected via DI and accessed through service constructors

### Service Layer
- Domain services end with "Service" suffix (e.g., ClientService, CashRegisterService)
- Automatically registered via reflection in ServiceCollectionExtensions.AddBusinessLogicServices()
- Use cases registered separately via AddUseCases()

### Event-Driven with MediatR
- MediatR used for domain events (not traditional CQRS commands/queries)
- Event consumers named `<Event>_Consumer` (e.g., BLCreated_Consumer)
- Events published when significant domain changes occur (BLCreated, TransactionVoidRequested, etc.)

### Repository Pattern
- **IUnitOfWorkRepository** - Primary repository with Get, GetAll, Add, Update, Delete, BulkUpdate
- **IUnitOfWorkRepository_v2** - Alternative repository implementation with different query patterns
- **IViewRepository** - Read-only access to database views
- **IUnitOfWorkFunctionRepository** - Execute stored procedures and table-valued functions
- **IDynamicRepository** - Direct Dapper-based queries using raw SQL

### Background Services
- Multiple IHostedService implementations in Nodus.Api/BackgroundServices/
- Handle periodic tasks like ERP sync, EDI downloads, release timeouts, notification processing
- Auto-registered via ServiceCollectionExtensions.AddHostedServices()
- HostOptions.BackgroundServiceExceptionBehavior set to Ignore to prevent app crashes

### Authentication & Authorization
- Development mode uses custom auth extension (AddDevelopmentAuthentication)
- Production uses AddProductionAuthentication
- Permission-based policies (e.g., Permissions.ClientsRead)
- ApiKeyAuthAttribute for API key authentication

### Caching
- HybridCache from Microsoft.Extensions.Caching.Hybrid
- Cache tags for invalidation (e.g., ApplicationDefaults.Cache.Tags.Client)
- Used in use cases for frequently accessed data (see GetClient.cs)

## Key Technical Decisions

### Database Access
- EF Core with DbContextPool (poolSize: 128) for performance
- CustomSqlServerRetryingExecutionStrategy with 6 retries, 30-second max delay
- Both EF Core and Dapper used (EF for writes, Dapper for complex queries via IDynamicRepository)

### Error Handling
- Result type from Nodus.Contracts.Entities for operation outcomes
- ExceptionHandlerMiddleware for centralized exception handling
- TreatWarningsAsErrors=true on all projects

### Configuration
- ApplicationSettings loaded from appsettings.json section
- ImportSysSettings for EDI import configuration
- Environment name can be overridden via ApplicationSettings.EnvironmentName

### EDI File Processing
- Multiple parser interfaces (IEDI_BL_FileParser, IEDI_BAPLIE_FileParser, etc.)
- Orchestrator pattern for file parsing
- File transfer via IFileTransfer_FTP
- Background service for periodic EDI downloads

### Swagger/OpenAPI
- Swagger enabled in Development environment only
- XML documentation from Nodus.Api.xml included
- EnumSchemaFilter for better enum documentation

## Project Conventions

### Naming
- Controllers: `{Entity}Controller.cs` in Nodus.Api/Controllers/
- Services: `{Entity}Service.cs` in Nodus.Application/{EntityPlural}/
- Use Cases: `_{Entity}UseCases.cs` in Nodus.Application/{EntityPlural}/
- Individual use case classes: descriptive names like GetClient, CreateClientInSAP
- Event handlers: `{EventName}_Consumer.cs`
- Background services: `{Purpose}BackgroundService.cs`

### Code Organization
- Each domain entity has its own folder in Nodus.Application (Clients, Bookings, VesselVoyages, etc.)
- Extensions methods in separate {Entity}Extensions.cs files
- DTOs defined in Nodus.Contracts matching entity structure

### Dependency Injection
- Services registered as Scoped by default
- Background services registered as Singleton via AddHostedServices()
- Query repositories auto-registered via AddQueryRepositories()

## ERP Integration

The system integrates with an external ERP (likely SAP based on naming):
- Sync entities from ERP to App via ERPWritterERPToAppService
- Sync entities from App to ERP (CreateClientInSAP, NotifyCashRegisterDailyClosingToERP)
- Background services monitor ERP health, sync data, and retry failed operations
- ERPServices registered via AddERPServices(Configuration)

## Special Considerations

### Thread Safety
The UnitOfWork implementation is specifically designed for thread safety in MediatR event handlers. When working with events, always use the scoped UnitOfWork pattern, never share DbContext instances across threads.

### Cash Register Operations
Cash register has complex state management with daily closings that must be notified to ERP. Background services handle retry logic for failed ERP notifications.

### Container & BL Operations
Core domain entities with extensive business rules. Operations tracked through container movements with inferred identifiers. Releases to customs and terminals have dedicated processor classes.

## Important Files to Reference

- Program.cs - Application startup and service registration
- AppDbContext.cs - All EF Core entities and DbSets
- UnitOfWork.cs - Repository pattern implementation with thread safety notes
- ServiceCollectionExtensions.cs - Service registration helpers
- .github/copilot-instructions.md - Memory Bank structure and workflow conventions

## Interaction Rules

- When the user asks a question, the agent must **respond with a plan/step-by-step outline**, without providing full code implementation.
- The plan should explain the reasoning, possible approaches, and design considerations.
- Code should only be provided if the user explicitly requests it (e.g., "give me the implementation" or "show me the code").
- Do not create/modify files, run commands, or refactor code unless the user explicitly asks for it. Read commands are an exception: you can run read commands like `tree`, `cat`, `ls`, `find`, `search` or even `cd` to understand the project structure and contents without asking the user.
- Plans must be structured with: **Context/Assumptions, Possible Approaches, Recommended Approach, Next Steps**.
- Plans should balance detail: clear enough to guide implementation, but concise enough to stay practical.
- Always consider the repository's technological constraints and conventions when proposing solutions.
- When proposing approaches, prioritize solutions that are simple, maintainable, and aligned with KISS/YAGNI principles.
- When proposing approaches, include early validations and fail fast checks to prevent invalid operations.
- Always respond in **American English**, regardless of the language used by the user (Spanish, English, or any other language).  

## Core Development Philosophy

### KISS (Keep It Simple, Stupid)
Simplicity should be a key goal in design. Choose straightforward solutions over complex ones whenever possible. Simple solutions are easier to understand, maintain, and debug.

### YAGNI (You Aren't Gonna Need It)
Avoid building functionality on speculation. Implement features only when they are needed, not when you anticipate they might be useful in the future.

### DRY (Don't Repeat Yourself)
Avoid unnecessary duplication, but do not over-abstract.
- Prefer clarity over clever abstractions.
- Small, intentional repetition is acceptable if it improves readability or preserves feature isolation.
- Extract shared logic only when it provides real value and aligns with the architecture (e.g., shared domain concepts, common infrastructure code).
- Do not apply DRY at the expense of slice isolation or domain clarity.
  
### PBD (Push Behaviour Down)
Business rules and behaviors should be placed at the lowest level where they make sense, prefer domain objects over services when possible.
- Prefer encapsulating logic inside entities, value objects, or domain services instead of application or controller layers.  
- Avoid anemic domain models: objects should carry both data and behavior.
- This promotes stronger invariants, reduces duplication, and improves maintainability.
- Apply this principle within each vertical slice to ensure behavior is localized to the relevant domain.

### Vertical Slice Architecture
Organize code by **feature/capability** instead of by technical layers.  
- Each slice should represent a complete domain or aggregate (e.g., `Order`, `User`, `Basket`).  
- Keep all relevant code (entities, value objects, domain logic, handlers, validation, persistence) together in the slice.  
- Avoid bloated service layers or god classes — business logic should live inside the slice, pushed down where appropriate.  
- The folder/project structure should reflect slices, not technical layers.  
- Improves testability, maintainability, and feature isolation.

### Design Principles

- **Dependency Inversion**: High-level modules should not depend on low-level modules. Both should depend on abstractions.
- **Open/Closed Principle**: Software entities should be open for extension but closed for modification.
- **Single Responsibility**: Each function, class, and module should have one clear purpose.
- **Fail Fast**: Detect potential errors as early as possible and raise exceptions immediately when issues occur.  
  - Include input and business rule validations at method entry points, constructors, and command handlers.  
  - Encourage throwing exceptions over silent failures when invariants are violated.  
  - Ensure domain invariants are checked before performing any state changes.

## 📋 Style & Conventions

- Do not add comments in entities private constructors.
- Always use primary constructors for services.
- Do not append "...Async" to method names; assume methods are asynchronous where applicable.
