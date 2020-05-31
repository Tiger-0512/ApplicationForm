pragma solidity ^0.4.24;

contract DappsToken {

    // トークンのメタ情報の設定
    string public name = 'DappsToken';
    string public symbol = 'DTKN';
    uint public decimals = 18;

    // トークンの合計供給量を保持
    uint public totalSupply;

    // 各アカウントの残高を保持
    mapping(address => uint) public balances;

    //コントラクトを初期化
    constructor() public {
        uint _initialSupply = 0;

        balances[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    /**
    * トークンの合計供給量を取得
    * @return トークンの合計供給量を表す uint 値
    */
    function totalSupply() public view returns (uint) {
        return (totalSupply);
    }

    /**
    * _owner アカウントの残高を取得
    * @param _owner 残高を取得するアカウントのアドレス
    * @return 渡されたアドレスが所有する残高を表す uint 値
    */
    function balanceOf(address _owner) public view returns (uint) {
        return (balances[_owner]);
    }

    /**
    * msg.sender が _to アカウントに指定した量のトークンを転送
    * @param _to トークンを転送するアカウントのアドレス
    * @param _value 転送するトークンの量
    * @return トークンの転送が成功したかどうかを表す bool 値
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender]);

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    event Transfer(address indexed from, address indexed to, uint value);
}