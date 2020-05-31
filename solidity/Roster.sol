pragma solidity ^0.4.24;

contract Roster {

    address private owner; //コントラクトオーナーのアドレス
    uint public numUser; //登録件数

    //登録情報を保存するデータ構造体
    struct userInfo {
        string firstname_;
        string lastname_;

        string prefecture_;
        string state_;
        string housenumber_;
        string apartment_;

        string year_;
        string month_;
        string day_;

        string gender_;
        string phonenumber_;
        uint flag; //登録者が受け取ったかどうかを判断
    }
    mapping(uint => userInfo) accounts;

    //コンストラクタ
    constructor() public {
        owner = msg.sender; // コントラクトを公開したアドレスをオーナーに指定する
        numUser = 0;        // 登録数の初期化
        setInfo();
    }

    //アクセス制限の実装
    modifier onlyOwner {
	    // コントラクトを呼び出したアドレスがオーナーと一致するか確認する
	    // 一致しない場合は処理を止める
        require(msg.sender == owner);
        _; // modifierの末尾に必要
    }

    //modifierを関数に付与する
    //ユーザー情報を登録する関数
    function setInfo() public onlyOwner {
        accounts[numUser].firstname_ = "T";
        accounts[numUser].lastname_ = "M";
        accounts[numUser].prefecture_ = "K";
        accounts[numUser].state_ = "KK";
        accounts[numUser].housenumber_ = "106";
        accounts[numUser].apartment_ = "H105";
        accounts[numUser].year_ = "1997";
        accounts[numUser].month_ = "5";
        accounts[numUser].day_ = "12";
        accounts[numUser].gender_ = "Male";
        accounts[numUser].phonenumber_ = "080";
        accounts[numUser].flag = 0;
        numUser++;
    }

    //ユーザー情報を取得する関数
    function getInfo(uint _numUser) view public onlyOwner returns(string, string, uint) {
        return (accounts[_numUser].firstname_, accounts[_numUser].lastname_, accounts[_numUser].flag);
    }
}