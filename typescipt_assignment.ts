class Product
{
    public productId:number = 0;
    public productName:string  = "";
    public unitPrice:number = 0;
    public qty:number = 0;

    constructor(productId:number)
    {
        this.productId = productId;
    }
    public getTotal():void
    {
        console.log(`Total : ${(this.unitPrice) * (this.qty)}`);
    }

    public showDetails():void
    {
        console.log("Product Id : " + this.productId);
        console.log("Product Name : " + this.productName);
        console.log("Unit Price : " + this.unitPrice);
        console.log("Quantity : " + this.qty);
        console.log("----------------------------");
    }
}

class Customer
{
    public customerId:number = 0;
    public customerName:string  = "";
    public customerCity:string = "";

    constructor();
    constructor(customerId: number);
    constructor(customerId: number, customerName: string);
    constructor(customerId: number, customerName: string, customerCity: string);

    constructor(customerId?: number, customerName: string = "", customerCity: string = "") {
        this.customerId = customerId ?? 0;
        this.customerName = customerName ?? "";
        this.customerCity = customerCity ?? "";
    }

    public showDetails():void
    {
        console.log(`Customer details :: Id : ${this.customerId}, Name : ${this.customerName}, City : ${this.customerCity}`)
    }
}




let p1:Product = new Product(46545);
p1.productName = 'Banana'
p1.qty = 10
p1.unitPrice = 8
p1.getTotal();
p1.showDetails();

let c1:Customer = new Customer();
let c2:Customer = new Customer(10256);
let c3:Customer = new Customer(10254, "Scott");
let c4:Customer = new Customer(10255, "Scott", "Hyd");

c1.showDetails();
c2.showDetails(); 
c3.showDetails();
c4.showDetails(); 