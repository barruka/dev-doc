# .NET secrets

1. Open a terminal
2. Navigate to the folder of the **PROJECT**
3. dotnet user-secrets init
4. dotnet user-secrets set "**name_of_the_service**:ConnectionString" "Server=192.168.0.13;Uid=dbmanager;Pwd=**PASWORD**;Database=**DATABASE**;Pooling=false;" --project .

## startup.cs
```csharp
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddGrpc(options => { options.EnableDetailedErrors = true; } );

            services.AddDbContext<MessagesContext>(options =>
                options.UseMySQL(Configuration["name_of_the_service:ConnectionString"]));
        }
```

## program.cs
```csharp
        public static void Main(string[] args)
        {
            var host = new HostBuilder()
                .ConfigureAppConfiguration((hostContext, builder) =>
                {
                if (hostContext.HostingEnvironment.IsDevelopment())
                    {
                        builder.AddUserSecrets<Program>();
                    }
                })
                .Build();

            host.Run();
        }
```
