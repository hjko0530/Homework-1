// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    bool isRegistered = false;
    function register() external returns (uint256) {
        // TODO: please add your implementaiton here
        if(isRegistered == false){
            isRegistered = true;
            return 2000;
        }
        if(isRegistered == true) return 123;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if(!IClassroomV2(msg.sender).isEnrolled()){
            return 2000;
        }else{
            return 123;
        }
    }
}

/* Problem 3 Interface & Contract */
interface IClassroomV3 {
    function code() external view returns (uint256);
    function isEnrolled() external view returns (bool);
}
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if(gasleft()%2 == 1){return 2000;}
        else {return 123;}
    }
}
