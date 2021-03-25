#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM microsoft/aspnetcore:2.0-nanoserver-1803 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0-nanoserver-1803 AS build
WORKDIR /src
COPY ["akstest/akstest.csproj", "akstest/"]
RUN dotnet restore "akstest/akstest.csproj"
COPY . .
WORKDIR "/src/akstest"
RUN dotnet build "akstest.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "akstest.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "akstest.dll"]