FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . .
RUN dotnet restore ./DotNet8.Pos.App/DotNet8.Pos.App.csproj
RUN dotnet publish ./DotNet8.Pos.App/DotNet8.Pos.App.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:5048
ENV ASPNETCORE_ENVIRONMENT=Production
COPY --from=build /app/publish .

EXPOSE 5048
ENTRYPOINT ["dotnet", "DotNet8.Pos.App.dll"]
