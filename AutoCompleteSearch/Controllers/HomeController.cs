using AutoCompleteSearch.DAL;
using AutoCompleteSearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AutoCompleteSearch.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //hello
            return View();
        }


        //init data for autocomplete filter
        public JsonResult GetValueAutoComplate()
        {
            AutoComplateView returnObj = new AutoComplateView();
            using (var db = new AutoComplateDatabaseEntities())
            {
                returnObj.Phones = new List<ItemView>();
                var queryPhone = from p in db.Phones
                                 join b in db.Brands on p.BrandId equals b.Id
                                 select new ItemView()
                                 {
                                     Id = p.Id,
                                     Name = p.Name,
                                     Description = p.Description + " " + b.Name
                                 };
                returnObj.Phones = queryPhone.ToList();

                returnObj.Brands = new List<ItemView>();
                var queryBrand = from b in db.Brands
                                 select new ItemView()
                                 {
                                     Id = b.Id,
                                     Name = b.Name,
                                     Description = b.Description
                                 };
                returnObj.Brands = queryBrand.ToList();
            }
            return Json(returnObj, JsonRequestBehavior.AllowGet);
        }

        //public ActionResult About()
        //{
        //    ViewBag.Message = "Your application description page.";

        //    return View();
        //}

        //public ActionResult Contact()
        //{
        //    ViewBag.Message = "Your contact page.";

        //    return View();
        //}
    }
}