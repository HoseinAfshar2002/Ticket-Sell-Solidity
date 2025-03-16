// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "contract/Ticket-lib.sol";
contract TcketSell {
    using  TicketLib for TicketLib.Ticket; //استفاده از کتابخانه

 uint counter = 0;


mapping(uint => TicketLib.Ticket) public tickets; //ایجاد مپینگ برای اینکه وقتی ای دی یک بلیط را دادیم اطلاعات ان بلیط را برگرداند
//mapping (string => mapping(string=>uint[ ])) public availableTicket;  // این مپینگ هم برای این است که وقتی پارامتر ها را به ان دادیم ببینم بلیط در دسترس است یا خیر

event TicketCreate (uint indexed ticketId, string from, string to,uint price); //ایجاد یک ایونت یا رویداد برای ایجاد بلیط
event TicketPurchased(uint indexed ticketId,address buyer); // ایجاد این ایونت هم برای زمانی است که بلیط خریداری می شود


function createTicket(string memory _from,string memory _to,uint _price) public  { //مقادیر ورودی را به فانکشن ایجاد بلیط می دهیم
    counter ++ ; //هر وقت بلیط اضافه شد یکی به تعداد ان اضافه کن
    TicketLib.Ticket storage newTicket = tickets[counter]; //یک نمونه از تیکت در کتابخانه می سازیم با نام نیو تیکت
    newTicket.createTicket(_from, _to, _price,counter);  //فانکش ایجاد بلیط را در کتابخانه به نمونه ساخته شده پاس می دهیم و مقدار دهی می کنیم 
  //  availableTicket[_from][_to].push(counter); //در این خط بررسی می کنیم که بلیطی از مبدا و مقصد مشخص وجود دارد یا خیر
    emit TicketCreate(counter, _from, _to, _price); //ایونت را پر می کمنیم
}

 function buyTicket(uint _ticketId) public payable { 
        // در خط زیر   تیکت باید بیشتر از صفر باشد و کوچک تر مساوی کانتر یا تعداد کل باشد 
        require( 
            _ticketId > 0 && _ticketId <= counter, 
            "ticket dos not exists" 
        ); 
        // یک نمونه می سازیم برای استفاده از لایبراری 
        TicketLib.Ticket storage ticket = tickets[_ticketId]; 
        // شرط برای اینکه تیکت از قبل فروخته شده یا خیر 
        require(!ticket.ticketOwned(), "ticket is already sold"); 
        //  یوزر باید مبلغ تیکت را پرداخت کند و مقدار کم تری پرداخت نکند 
        require(msg.value >= ticket.price, "insufficient founds"); 
        // مالکیت تیکت را به خریدار انتقال می دهیم 
        ticket.transferTicket(msg.sender); 
        // ایونت را پر می کنیم با امیت کردن 
        emit TicketPurchased(_ticketId, msg.sender); 
    } 
 
    function searchTicket(uint _ticketId) 
        public 
        view 
        returns (TicketLib.Ticket memory) 
    { 
        // در کد زیر و شرط زیر می گوییم تیکت ای دی باید بزرگ تر از صفر و کوچک تر از مقدار کل یا کانتر باشد 
        require( 
            _ticketId > 0 && _ticketId <= counter, 
            "ticket does not exists " 
        ); 
        return tickets[_ticketId]; 
    } 


}



  