using System;
using System.Collections.Generic;

namespace LVT_2415053122340.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public DateTime? OrderDate { get; set; }

    public string? CustomerName { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
