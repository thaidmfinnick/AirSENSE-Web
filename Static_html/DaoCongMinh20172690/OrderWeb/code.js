var items = [
    {
        name: 'bánh mì 001',
        price: 6.9,
        quantity: 1
    },
    {
        name: 'bánh mì 002',
        price: 7.9,
        quantity: 1
    }
]

const shipping = 2
//render
function render() {
    let subtotal = 0;
    items.forEach(Item =>{
        subtotal += Item.quantity*Item.price
    })
    var html=''
    let total = subtotal+shipping

    for(let i = 0; i <items.length; i++)
    {
        let item = items[i];
        html += '<li>'+
        '<span class="name">'+ item.name + '</span>' +
        '<span class="quantity">' +
        '<button onclick="decrease(' + i + ')">-</button>' +
        '<input type="number," value="' + item.quantity +'">' +
        '<button onclick="increase(' + i + ')">+</button></span>' +
        '<span class="total"><span>$' + (item.price*item.quantity).toFixed(2) + ' </span>'+
        '<button onclick="deletebtn(' + i + ')">X</button></span>'+
        '</li>'
    }
    var menuorder = document.getElementById('menu-order')
    menuorder.innerHTML = html;
    
    $('#subtotal').text(subtotal.toFixed(2) + " VND")
    $("#shipping").text(shipping + " VND")
    $('#total').text(total.toFixed(2) + " VND")
}
//dec an inc function
function decrease(index){
    items[index].quantity -= 1;
    if(items[index].quantity < 1)
    {
        items[index].quantity = 1;
    }
    
    render();
}
function increase(index){
    items[index].quantity += 1;
    if(items[index].quantity > 100)
    {
        items[index].quantity = 100;
    }
    
    render();
    
}
//remove function
function remove(index) {
    items.splice(index, 1)
    render();   
}
//delete function
function deletebtn(index)
{
    remove(index);
}
//Get input function
function input(index)
{
    let a = document.getElementById(index);
    return a.value;
}
//create new item
function createitem(){
    var name = input("name-add");
    var price = input("total-add");
    var quantity = input("quantity-add");
    if(name != "" && price != "" && quantity != "")
    {
        pushItem({
        name: name,
        price: Number(price),
        quantity: Number(quantity)
        })
    }
    else return;
    render();
}
//push item function
function pushItem(item)
{
    items.push(item);
}
$('#Add').on('click', createitem) // event create
render();

//validate
$(document).ready(function() {

    //Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
    $("#Add-form").validate({
        rules: {
            name: "required",
            num: {
                required: true,
                min: 1,
                max: 100
            },
            total: {
                required: true,
                min: 1,
                max: 100
            }
        },
        messages: {
            name: "Vui lòng nhập tên sp",
            num: {
                required: "Vui lòng nhập số lượng",
                min: "Nhập nhiều hơn 1",
                max: "nhập ít hơn 100"
            },
            total: {
                required: "Vui lòng nhập đơn giá"
            }
        }
    });
});