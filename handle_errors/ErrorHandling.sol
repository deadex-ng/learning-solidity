// Specifies the version of Solidity, using semantic versioning.
// Learn more: https://solidity.readthedocs.io/en/v0.5.10/layout-of-source-files.html#pragma
pragma solidity >=0.8.17;


contract ErrorHandling {

    function testRequire(uint _i) public pure{

        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        if (_i<=10){
            revert ("Input must be greater than 10");
        }
    }

    uint public num; 

    function testAssert() public view {
        
        assert(num == 0 );
    }

    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view{
        uint bal = address(this).balance; 
        if (bal < _withdrawAmount){
            revert InsufficientBalance({balance: bal,withdrawAmount: _withdrawAmount});
        }

    }

}


