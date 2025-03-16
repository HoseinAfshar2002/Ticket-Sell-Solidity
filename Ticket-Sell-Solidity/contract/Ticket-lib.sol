// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
library TicketLib { //ساخت یک کتابخانه برای استفاده ان در پروژه فرش بلیط

    struct Ticket{ // ساخت استراکت یا همان ساختار بلیط

      string from;
      string to;
      address owner;
      uint price;
      uint id;
    }
    //ساخت یک فانکشن برای ایجاد بلیط،در داخل ورودی فانکشن ابتدا از استراکت بلیط یک نمونه می سازیم و بعد مابقی مقادیر را به ورودی می دهیم
    function createTicket(Ticket storage _ticket,string memory _from,string memory _to, uint _price,uint _id)internal  {
        //در خط های زیر در بدنه فانکشن نیز مقادیری که در نمونه بالا از ساخنتار تیکت ساختیم را برابر با مقادیر ورودی قرار می دهیم
         _ticket.from = _from;
         _ticket.to = _to;
         _ticket.owner = address(0);
         _ticket.price = _price;
         _ticket.id = _id;


    }
    // در فانکشن زیر این را بررسی می کنیم که بلیط مالک و اونری دارد یا خیر؟و این را با یک مقدار ترو یا فالس در ریترن فانکشن با بولین مشخص می کنیم
     function ticketOwned(Ticket storage _ticket)internal view returns (bool) {
        return _ticket.owner != address(0); // این خط مشخص می کند که اگر تیکت مالکی داشت ترو برگرداند اگر مالک و صاحبی نداشت فالس برگرداند
    }
    //در فانکش زیر هم یک نمخونه از استراکت تیکت می سازیم منثل دو فانکشن بالا و یک نیو اونر جدید به ورودذی می دهیم 
     function transferTicket(Ticket storage _ticket, address _nweOwner)internal  {
        _ticket.owner = _nweOwner; // در این خط هم مشخص می کنیم که اگر یک یوزر تیکت را خرید مالکیتش به خریدار برسد
    }
}