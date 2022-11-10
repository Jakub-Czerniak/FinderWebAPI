using DataAccess.DbAccess;
using FinderWebAPI.Apis;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
builder.Services.AddSingleton<IUserData, UserData>();
builder.Services.AddSingleton<IInterestData, InterestData>();
builder.Services.AddSingleton<IPairData, PairData>();
builder.Services.AddSingleton<IEmailData, EmailData>();
builder.Services.AddSingleton<IMatchEngineData, MatchEngineData>();
builder.Services.AddSingleton<ILoginData, LoginData>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.ConfigureEmailApi();
app.ConfigureUserApi();
app.ConfigureInterestApi();
app.ConfigureLoginApi();
app.ConfigureMatchEngineApi();
app.ConfigurePairApi();

app.Run();