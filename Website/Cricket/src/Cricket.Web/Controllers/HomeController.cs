using Microsoft.AspNetCore.Mvc;

namespace Cricket.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult PlaceHolder()
        {
            return View();
        }
    }
}
