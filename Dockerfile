FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app
COPY ["app_docker_21_dias.csproj", "."]
RUN dotnet restore "./app_docker_21_dias.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "app_docker_21_dias.csproj" -c Release -o /app_docker_21_dias/release

FROM build AS publish
RUN dotnet publish "app_docker_21_dias.csproj" -c Release -o /app/release

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "app_docker_21_dias.dll"]
