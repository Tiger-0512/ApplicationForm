pragma solidity ^0.4.24;

import "./Roster.sol";

contract Regist is Roster {

    //応募者の情報
    struct Applyer {
        string firstname;
        string lastname;

        string prefecture;
        string state;
        string housenumber;
        string apartment;

        string year;
        string month;
        string day;

        string gender;
        string phonenumber;
        address owneraddress;
    }
    mapping(uint => Applyer) _Applyer;

    //応募者の情報を格納
    function setApplyer(string _firstname, string _lastname, string _prefecture, string _state, string _housenumber, string _apartment, string _year, string _month, string _day, string _gender, string _phonenumber) public onlyOwner {
        _Applyer[0].firstname = _firstname;
        _Applyer[0].lastname = _lastname;
        _Applyer[0].prefecture = _prefecture;
        _Applyer[0].state = _state;
        _Applyer[0].housenumber = _housenumber;
        _Applyer[0].apartment = _apartment;
        _Applyer[0].year = _year;
        _Applyer[0].month = _month;
        _Applyer[0].day = _day;
        _Applyer[0].gender = _gender;
        _Applyer[0].phonenumber = _phonenumber;
    }
}
