contract c10270{
    /**
    * Pre-ICO sale starts on 01 of Jul, ends on 05 Jul 2018
    * 1st. Stage starts 06 of Jul, ends on 15 of Jul , 2018
    * 2nd. Stage starts 16 of Jul, ends on 25 of Jul , 2018
    * 3rd. Stage starts 26 of Jul, ends on 05 of Aug , 2018
    * 4th. Stage starts 06 of Aug, ends on 15  of Aug , 2018
    */
    function getPeriod(uint256 _currentDate) public pure returns (uint) {
        //1530403200 - July, 01, 2018 00:00:00 && 1530835199 - July, 05, 2018 23:59:59
        if( 1530403200 <= _currentDate && _currentDate <= 1530835199){
            return 0;
        }
        //1530835200 - July, 06, 2018 00:00:00 && 1531699199 - July, 15, 2018 23:59:59
        if( 1530835200 <= _currentDate && _currentDate <= 1531699199){
            return 1;
        }
        //1531699200 - July, 16, 2018 00:00:00 && 1532563199 - July, 25, 2018 23:59:59
        if( 1531699200 <= _currentDate && _currentDate <= 1532563199){
            return 2;
        }
        //1532563200 - July, 26, 2018 00:00:00 && 1533513599 - August,   05, 2018 23:59:59
        if( 1532563200 <= _currentDate && _currentDate <= 1533513599){
            return 3;
        }
        //1533513600 - August,   06, 2018 00:00:00 && 1534377599 - August,   15, 2018 23:59:59
        if( 1533513600 <= _currentDate && _currentDate <= 1534377599){
            return 4;
        }
        return 10;
    }
}