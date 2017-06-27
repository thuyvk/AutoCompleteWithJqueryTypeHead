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