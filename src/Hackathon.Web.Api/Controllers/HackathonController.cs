using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Hackathon.Web.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HackathonController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<HackathonController> _logger;

        public HackathonController(ILogger<HackathonController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public string Post(Person person)
        {
            return person.ToString();
        }
        
        [HttpGet]
        public IEnumerable<string> Get()
        {
            Console.WriteLine(">> HELLO FROM WEATHER FORECAST CONTROLLER!");
        
            return Summaries;
        }
    }

    public class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DateOfBirth { get; set; }

        public override string ToString()
        {
            if (Environment.GetEnvironmentVariable("IS_CANDIDATE_DEPLOYMENT") != null && 
                Boolean.Parse(Environment.GetEnvironmentVariable("IS_CANDIDATE_DEPLOYMENT")))
            {
                string formattedDateOfBirth;
                try
                {
                    formattedDateOfBirth = DateTime.Parse(DateOfBirth).ToString("d");
                }
                catch (Exception e)
                {
                    formattedDateOfBirth = "INVALID DATE OF BIRTH";
                }
                return $"{FirstName} {LastName} {formattedDateOfBirth}";
            }
            
            return $"{FirstName} {LastName} {DateOfBirth}";
        }
    }
}