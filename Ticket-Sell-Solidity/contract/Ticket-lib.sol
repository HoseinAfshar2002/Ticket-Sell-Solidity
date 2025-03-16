// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
library TicketLib { 

    struct Ticket{ 

      string from;
      string to;
      address owner;
      uint price;
      uint id;
    }
    function createTicket(Ticket storage _ticket,string memory _from,string memory _to, uint _price,uint _id)internal  {
         _ticket.from = _from;
         _ticket.to = _to;
         _ticket.owner = address(0);
         _ticket.price = _price;
         _ticket.id = _id;


    }
     function ticketOwned(Ticket storage _ticket)internal view returns (bool) {
        return _ticket.owner != address(0); 
    }
     function transferTicket(Ticket storage _ticket, address _nweOwner)internal  {
        _ticket.owner = _nweOwner; 
    }
}
