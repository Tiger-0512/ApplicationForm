pragma solidity ^0.4.24;

import "./Confirm.sol";
import "./DappsToken.sol";

contract SendToken is Confirm, DappsToken {

    //応募者のアカウントに100，000トークンを付与
    function Send() public {
        require(confirmation() == true, "Contract is not establshed!");

        _Applyer[0].owneraddress = 0x916972C98b8106457Ea3d74A7bA7b203BD3Fa6D0;
        balances[0x916972C98b8106457Ea3d74A7bA7b203BD3Fa6D0] += 100000;
        accounts[index].flag = 1;
    }
}