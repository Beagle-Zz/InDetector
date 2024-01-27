contract c8450{
    // Calculates amount of bonus tokens
    function getBonus(uint _value, uint _sold) internal constant returns (TokensHolder) {
        TokensHolder memory result;
        uint _bonus = 0;
        result.tokens = _value;
        for (uint8 i = 0; _value > 0 && i < bonusLimit.length; ++i) {
            uint current_bonus_part = 0;
            if (_value > 0 && _sold < bonusLimit[i]) {
                uint bonus_left = bonusLimit[i] - _sold;
                uint _bonusedPart = min(_value, bonus_left);
                current_bonus_part = current_bonus_part.add(percent(_bonusedPart, bonusPatterns[i]));
                _value = _value.sub(_bonusedPart);
                _sold = _sold.add(_bonusedPart);                
            }
            if (current_bonus_part > 0) {
                _bonus = _bonus.add(current_bonus_part);
            }
        }
        result.bonus = _bonus;
        return result;
    }
}