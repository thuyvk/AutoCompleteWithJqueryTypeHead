# Auto Complete With Jquery TypeHead in Asp.Net MVC5
Auto complete search in asp.net mvc with jquery-typehead

## 1. Download jquery-typehead
link download: [http://www.runningcoder.org/jquerytypeahead/]
- Add jquery.typeahead.min.css to folder Content 
- Add jquery.typeahead.min.js to folder Scripts

## 2. Create demo database
- Run sql script at folder ~/ScriptDatabase/ScriptDatabase.sql to create demo database

## 3. Code Behind
- Create ~/Models/AutoCompleteView.cs
```
using System.Collections.Generic;
namespace AutoCompleteSearch.Models
{
    public class AutoCompleteView
    {
        public List<ItemView> Phones { set; get; }//iphone 4, iphone 5, samsung galaxy s8...
        public List<ItemView> Brands { set; get; }//apple, samsung, xixaomin
    }
    public class ItemView
    {
        public int Id { set; get; }
        public string Name { set; get; }
        public string Description { set; get; }
        public string Icon { set; get; }
    }
}
```
- In HomeController.cs, create function GetValueAutoComplete (will get data from demo database and convert to json object)
```
//init data for autocomplete filter
        public JsonResult GetValueAutoComplate()
        {
            AutoCompleteView returnObj = new AutoCompleteView();
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
```
## 4. Javascript
- Add css & js of jquery-typehead to _Layout.cshtml page
```
<link href="~/Content/jquery.typeahead.min.css" rel="stylesheet" />
<script src="~/Scripts/jquery.typeahead.min.js"></script>

```
- Add search form and javascript function to Index.cshtml page
```
<div class="row">
    <div class="col-md-3">
        @*Input auto complete*@
        <div class="typeahead__container">
            <div class="typeahead__field">

                <span class="typeahead__query">
                    <input class="js-typeahead"
                           name="q"
                           type="search"
                           placeholder="Enter product name or brand"
                           autocomplete="off">
                </span>
            </div>
        </div>

        @*hidden value for search*@
        <input type="hidden" id="TypeSearch" />
        <input type="hidden" id="Keyword" />
    </div>
    <div class="col-md-4">
        @*Submit button*@
        <input type="submit" name="submit" value="Search" class="btn btn-primary" />
    </div>
</div>
```
and javascript function
```
@section scripts{
    <script>
        $.typeahead({
            input: ".js-typeahead",
            order: "asc",
            hint: true,
            group: {
                template: "{{group}}"
            },
            maxItemPerGroup: 5,
            template: function (query, item) {
                return "<div class='suggest-item'>{{Name}} - <small>{{Description}}</small></div>";
            },
            source: {
                "Phones": {
                    ajax: {
                        url: "/Home/GetValueAutoComplate",
                        path: "Phones"
                    },
                    display: "Name"
                },
                "Brands": {
                    ajax: {
                        url: "/Home/GetValueAutoComplate",
                        path: "Brands"
                    },
                    display: "Name"
                }
            },
            callback: {
                onClickAfter: function (node, a, item, event) {
                    $('#TypeSearch').val(item.group);
                    $('#Keyword').val(item.Name);
                }
            }
        });
    </script>
}
```

