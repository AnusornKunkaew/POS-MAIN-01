FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . .
RUN dotnet restore ./DotNet8.PosBackendApi/DotNet8.PosBackendApi.csproj
RUN dotnet publish ./DotNet8.PosBackendApi/DotNet8.PosBackendApi.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:5192
ENV ASPNETCORE_ENVIRONMENT=Production

COPY --from=build /app/publish .

EXPOSE 5192
ENTRYPOINT ["dotnet", "DotNet8.PosBackendApi.dll"]
