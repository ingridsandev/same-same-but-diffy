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
        public Customer Post(Customer customer)
        {
            var rnd = new Random();
            var num  = rnd.Next(1, 5);
            var test = num % 2 == 0;
            
            return new Customer
            {
                FirstName = customer.FirstName,
                IsAlive = test
            };
        }
        
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return Summaries;
        }
    }

    public class Customer
    {
        public string FirstName { get; set; }
        public bool IsAlive { get; set; }
    }
}