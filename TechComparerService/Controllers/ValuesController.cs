using System;
using Microsoft.AspNetCore.Mvc;
using TechnologyComparerService.DataHelper;
using Microsoft.Extensions.Logging;
using System.Net.WebSockets;

namespace TechnologyComparerService.Controllers
{

    [ApiController]
    [Route("[controller]")]
    public class ValuesController : ControllerBase
    {
        ModelHelper modelHelper = new ModelHelper();
        private readonly ILogger<ValuesController> _logger;

        public ValuesController(ILogger<ValuesController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult GetFactorSectorValues()
        {
            try
            {
                var result = modelHelper.fillFactorSectorValueModel();
                if (result != null)
                    return Ok(result);
                else
                    return NotFound();
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error GetFactorSectorValues(): " + ex.Message);
                return NotFound();
            }
        }
    }
}
