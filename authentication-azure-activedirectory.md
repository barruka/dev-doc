# Authentication: ASP.NET Core and Azure Active Directory

- **Azure Services**
- **Azure Active Directory** (AAD)
- Left side menu > Manage > **App Registrations**

## Register our client app inside the auth server

- New Registration
- Set Name
- Set Supported account types
- Ignore Redirect Uri
- Click **REGISTER**

We have to specify how users can authenticate
- Inside the registered app, left side menu > Manage > **Authentication**
- Platform configuration > **Add a platform** > select the platform
- **Redirect Uri** where the token will be sent after auth, then click **CONFIGURE**

## Tell AAD that there is a protected resource (our API)

NOT ENDED YET



<img src="https://i.postimg.cc/0jdL19qT/aad-auth.jpg">

https://slides.com/rainerstropek/aad-auth-for-apis#/2/0/13

# Resources

- Modern Authentication: ASP.NET Core and Azure Active Directory - Part 1: https://www.youtube.com/watch?v=ND6EKbGb7vQ
- Modern Authentication: ASP.NET Core and Azure Active Directory - Part 2: https://www.youtube.com/watch?v=R_LIjafo6cY
- Modern Authentication: ASP.NET Core and Azure Active Directory - Part 3: https://www.youtube.com/watch?v=Ca52hqMiNro
