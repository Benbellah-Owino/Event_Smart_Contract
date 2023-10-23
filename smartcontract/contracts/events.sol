// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract EventsGroup10{

    //Struct definitions
    struct Event{
        uint id;
        string db_id;
        uint256 noOfTickets;
        uint price;
        address organizer; 
        bool completed;
        uint timecreated;
    }

    struct Organizer{
        string organizer_id;
        string name;
        uint timejoined;
    }

    struct Ticket{
        uint id;
        string ticket_id;
        string event_id;
        address owner;
        uint timeissued;
        TicketStatus status;
    }

    enum TicketStatus{
        VALID,
        USED,
        RETURNED
    }

    enum TransactionStatus{
        PENDING,
        SUCCESS,
        FAILED
    }

    //Array definitions
    address[] private DappCreators;
    address[] private OrganizerList;
    address contractContracts;

    //Mapping definitions
    mapping(address => Organizer) private organizers;

    mapping(address => Event[]) private events;

    mapping(address => Ticket[]) tickets;


   
//DappCreators functions
    constructor () payable {
         DappCreators.push(msg.sender);
    }

    function addCreators(address _owner) private{
        DappCreators.push(_owner);
    }
 
    function listCreators() public view returns (address[] memory){
        return DappCreators;
    }

    //Event functions
    function createEvent(string memory _db_id, uint _no_Of_tickets, uint256 _price)public returns (Event memory){
        Event memory new_event;

        new_event.id = events[msg.sender].length;
        new_event.db_id = _db_id;
        new_event.noOfTickets = _no_Of_tickets;
        new_event.price = _price;
        new_event.organizer = msg.sender;
        new_event.completed = false;
        new_event.timecreated = block.timestamp;

        events[msg.sender].push(new_event);
      

        return new_event;
    }

    function listOrganizersEvents(address _organizers)public view returns (Event[] memory) {
        return events[_organizers];
    }

    function getSpecificEvent(address _organizer, uint _id) public view returns (Event memory){
        return events[_organizer][_id];
    }

    //Organizer functions
    function create_organizer(string memory _name, string memory _id) public{
        Organizer memory newOrganizer;
        newOrganizer.name = _name;
        newOrganizer.timejoined = block.timestamp;
        newOrganizer.organizer_id = _id;

        organizers[msg.sender] = newOrganizer;
        OrganizerList.push(msg.sender);
    }




    //Ticket Function
    // modifier correctBalance(uint price) {
    //     require( > price, "You do not have enough ETH to buy this tickets");
    //     _;
    // }
    function buyTicket(string memory _ticketId, string memory _eventId,uint _price, address _to ) public  payable returns (Ticket memory){
        require(msg.value >= _price, "Wrong amount");

        Ticket memory new_ticket;
        new_ticket.id = tickets[msg.sender].length;
        new_ticket.ticket_id = _ticketId;
        new_ticket.event_id = _eventId;
        new_ticket.owner = msg.sender;
        new_ticket.timeissued = block.timestamp;
        new_ticket.status = TicketStatus.VALID;

        tickets[msg.sender].push(new_ticket);

        return new_ticket;
    }

    modifier isORGANIZER(address _organizer){
        require(msg.sender == _organizer, "Ticket authentication rejected");
        _;
    }



    function confirmTicket(address _organizer, address _customer, uint _contract_id, uint _price) public payable isORGANIZER(_organizer) returns (TransactionStatus){
        
        if(tickets[_customer][_contract_id].status == TicketStatus.VALID ){
              (bool success,) = _organizer.call{value: _price}("");
            if(success == true){
                tickets[_customer][_contract_id].status = TicketStatus.USED;
            return TransactionStatus.SUCCESS;
            }
            
        }

        return TransactionStatus.FAILED;
    }

    function returnTicket(address _organizer, address _customer, uint _contract_id, uint _price) public payable isORGANIZER(_organizer) returns (TransactionStatus){
        if(tickets[_customer][_contract_id].status == TicketStatus.VALID ){
            (bool success,) = _customer.call{value: _price}("");
            if(success == true){
                tickets[_customer][_contract_id].status = TicketStatus.RETURNED;
                return TransactionStatus.SUCCESS;
            }
        }

         return TransactionStatus.FAILED;
    }

}