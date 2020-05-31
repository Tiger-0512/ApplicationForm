function func() {
    //textboxの文字を取得する
    var firstname = document.getElementById('firstname').value;
    var lastname = document.getElementById('lastname').value;
    var prefecture = document.getElementById('prefecture').value;
    var state = document.getElementById('state').value;
    var housenumber = document.getElementById('housenumber').value;
    var apartment = document.getElementById('apartment').value;
    var year = document.getElementById('year').value;
    var month = document.getElementById('month').value;
    var day = document.getElementById('day').value;

    var male = document.getElementById('inlineCheckbox1');
    var female = document.getElementById('inlineCheckbox2');
    var other = document.getElementById('inlineCheckbox3');
    if(male.checked){
        var gender = document.getElementById('inlineCheckbox1').value;
    }
    if(female.checked){
        var gender = document.getElementById('inlineCheckbox2').value;
    }
    if(other.checked){
        var gender = document.getElementById('inlineCheckbox3').value;
    }

    var phonenumber = document.getElementById('phonenumber').value;

    //コントラクトの実行
    var response_1 = contract.methods.setApplyer(firstname, lastname, prefecture, state, housenumber, apartment, year, month, day, gender, phonenumber).call();
    var response_2 = contract.methods.Send().call();
    console.log(response_2);
}


//残高の確認
function confirm() {
    let response_3 = contract.methods.balanceOf('0x916972C98b8106457Ea3d74A7bA7b203BD3Fa6D0').call();
    console.log("balance: ", response_3);
    document.getElementById('balance').innerHTML = balance;
}

//web3初期化
if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
}

//コントラクトを呼び出すアカウント
let coinbase = web3.eth.accounts[0];

//コントラクトのアドレス
const address = "0x10c77caff8d2433a1a3b44a415282efd83cd0d9c";

//ABI情報
const abi =[
    {
        "constant": true,
        "inputs": [],
        "name": "name",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "totalSupply",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "_numUser",
                "type": "uint256"
            }
        ],
        "name": "getInfo",
        "outputs": [
            {
                "name": "",
                "type": "string"
            },
            {
                "name": "",
                "type": "string"
            },
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "",
                "type": "address"
            }
        ],
        "name": "balances",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "index",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "decimals",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "_owner",
                "type": "address"
            }
        ],
        "name": "balanceOf",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "confirmation",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [],
        "name": "Send",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "symbol",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "_to",
                "type": "address"
            },
            {
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "transfer",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [],
        "name": "setInfo",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "_firstname",
                "type": "string"
            },
            {
                "name": "_lastname",
                "type": "string"
            },
            {
                "name": "_prefecture",
                "type": "string"
            },
            {
                "name": "_state",
                "type": "string"
            },
            {
                "name": "_housenumber",
                "type": "string"
            },
            {
                "name": "_apartment",
                "type": "string"
            },
            {
                "name": "_year",
                "type": "string"
            },
            {
                "name": "_month",
                "type": "string"
            },
            {
                "name": "_day",
                "type": "string"
            },
            {
                "name": "_gender",
                "type": "string"
            },
            {
                "name": "_phonenumber",
                "type": "string"
            }
        ],
        "name": "setApplyer",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "numUser",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "anonymous": false,
        "inputs": [
            {
                "indexed": true,
                "name": "from",
                "type": "address"
            },
            {
                "indexed": true,
                "name": "to",
                "type": "address"
            },
            {
                "indexed": false,
                "name": "value",
                "type": "uint256"
            }
        ],
        "name": "Transfer",
        "type": "event"
    }
];

//コントラクトのインスタンス
const contract = new web3.eth.Contract(abi, address);
