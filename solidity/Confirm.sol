pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

import "./Regist.sol";

contract Confirm is Regist {

    uint i; //繰り返し変数
    uint public index; //情報が格納されているインデックス

    //応募者と一致する名簿があるかの確認
    function confirmation() public view returns(bool) {

        for(i = 0; i < numUser; i++) {
            if(accounts[numUser].flag == 0){ //既に受取済でないかの確認
                if(uint(keccak256(accounts[i].firstname_)) == uint(keccak256(_Applyer[0].firstname)) &&
                uint(keccak256(accounts[i].lastname_)) == uint(keccak256(_Applyer[0].lastname)) &&
                uint(keccak256(accounts[i].prefecture_)) == uint(keccak256(_Applyer[0].prefecture)) &&
                uint(keccak256(accounts[i].state_)) == uint(keccak256(_Applyer[0].state)) &&
                uint(keccak256(accounts[i].housenumber_)) == uint(keccak256(_Applyer[0].housenumber)) &&
                uint(keccak256(accounts[i].apartment_)) == uint(keccak256(_Applyer[0].apartment)) &&
                uint(keccak256(accounts[i].year_)) == uint(keccak256(_Applyer[0].year)) &&
                uint(keccak256(accounts[i].month_)) == uint(keccak256(_Applyer[0].month)) &&
                uint(keccak256(accounts[i].day_)) == uint(keccak256(_Applyer[0].day)) &&
                uint(keccak256(accounts[i].gender_)) == uint(keccak256(_Applyer[0].gender)) &&
                uint(keccak256(accounts[i].phonenumber_)) == uint(keccak256(_Applyer[0].phonenumber))
                ) {
                    index = i;
                    return true;
                }
            }
        }
        return false;
    }
}
