// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Events{

    struct Event{
        string id;
        uint256 noOfTickets;
        uint price;
        address organizer; 
        bool completed;
    }

    Event[] public events;
    address[] public DappCreators;

    // constructor(){
    //     DappCreators[0] = msg.sender;
    // }

    function createEvent(string memory _id, uint _no_Of_tickets, uint256 _price)public view returns (Event memory){
        Event memory new_event;

        new_event.id = _id;
        new_event.noOfTickets = _no_Of_tickets;
        new_event.price = _price;
        new_event.organizer = msg.sender;
        new_event.completed = false;

        events.push(new_event);

        return new_event;
    }
}