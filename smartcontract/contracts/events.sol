// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

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
    }

    //Array definitions
    address[] private DappCreators;
    address[] private OrganizerList;
    address contractContracts;

    //Mapping definitions
    mapping(address => Organizer) private organizers;

    mapping(address => Event[]) private events;


   
//DappCreators functions
    constructor() private{
         DappCreators.push(msg.sender);
    }

    function addCreators(address _owner){
        DappCreators.push(_owner);
    }
 
    function listCreators() public view returns address[]{
        return DappCreators;
    }

    //Event functions
    function createEvent(string memory _db_id, uint _no_Of_tickets, uint256 _price)public view returns (Event memory){
        Event memory new_event;

        new_event.id = events[msg.sender].length;
        new_event._db_id = _db_id;
        new_event.noOfTickets = _no_Of_tickets;
        new_event.price = _price;
        new_event.organizer = msg.sender;
        new_event.completed = false;
        new_event.timecreated = block.timestamp

        events[msg.sender].push(new_event);
      

        return new_event;
    }

    function listOrganizersEvents(address _organizers)public returns (Event[] memory) {
        return events[_organizers];
    }

    function getSpecificEvent(address _organizer, uint _id) public returns (Event memory){
        return events[_organizer][_id];
    }

    //Organizer functions
    function create_organizer(string memory _name, string memory _id) public{
        Organizer newOrganizer;
        newOrganizer.name = _name;
        newOrganizer.timejoined = block.timestamp;
        newOrganizer.organizer_id = _id;

        organizers[msg.sender] = newOrganizer;
        OrganizerList.push(msg.sender);
    }




    //Ticket Function
    modifier correctBalance(uint price){
        require(sender.balance > price, "You do not have enough ETH to buy this tickets");
        _;
    }
    function buyTicket(uint256 _id ){
        
    }

}