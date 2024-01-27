contract c4135{
  // @dev Enter this arena.
  function enterArena(uint256[4] _tokenIds, address _enemyAddress)
    whenNotPaused
    public
  {
    // Shouldn't fight against self.
    require(msg.sender != _enemyAddress);
    // Each hero should be with different ids.
    require(_tokenIds[0] == 0 || (_tokenIds[0] != _tokenIds[1] && _tokenIds[0] != _tokenIds[2] && _tokenIds[0] != _tokenIds[3]));
    require(_tokenIds[1] == 0 || (_tokenIds[1] != _tokenIds[0] && _tokenIds[1] != _tokenIds[2] && _tokenIds[1] != _tokenIds[3]));
    require(_tokenIds[2] == 0 || (_tokenIds[2] != _tokenIds[0] && _tokenIds[2] != _tokenIds[1] && _tokenIds[2] != _tokenIds[3]));
    require(_tokenIds[3] == 0 || (_tokenIds[3] != _tokenIds[0] && _tokenIds[3] != _tokenIds[1] && _tokenIds[3] != _tokenIds[2]));
    // Check ownership and availability of the heroes.
    require(checkOwnershipAndAvailability(msg.sender, _tokenIds));
    // The play record of the enemy should exist.
    // The check is done with the enemy's enemy address, because the default value of it will be address(0).
    require(addressToPlayRecord[_enemyAddress].enemyAddress != address(0));
    // Set seed.
    seed += uint32(now);
    // Define play record here.
    PlayRecord memory _playRecord;
    _playRecord.initialSeed = seed;
    _playRecord.enemyAddress = _enemyAddress;
    _playRecord.tokenIds[0] = _tokenIds[0];
    _playRecord.tokenIds[1] = _tokenIds[1];
    _playRecord.tokenIds[2] = _tokenIds[2];
    _playRecord.tokenIds[3] = _tokenIds[3];
    // The information that can give additional information.
    TurnInfo memory _turnInfo;
    // Step 1: Retrieve Hero information (0 ~ 3) & Enemy information (4 ~ 7).
    uint32[5][8] memory _unitStats; // Stats of units for given levels and class ids.
    uint8[2][8] memory _unitTypesAuras; // 0: Types of units for given levels and class ids. 1: Auras of units for given levels and class ids.
    // Retrieve deployed hero information.
    if (_tokenIds[0] != 0) {
      _playRecord.unitClassIds[0] = heroContract.getHeroClassId(_tokenIds[0]);
      (_playRecord.unitLevels[0], _turnInfo.originalExps[0], _unitStats[0], , ) = correctedHeroContract.getCorrectedStats(_tokenIds[0]);
      (, , , , _unitTypesAuras[0][0], , _unitTypesAuras[0][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[0]);
    }
    if (_tokenIds[1] != 0) {
      _playRecord.unitClassIds[1] = heroContract.getHeroClassId(_tokenIds[1]);
      (_playRecord.unitLevels[1], _turnInfo.originalExps[1], _unitStats[1], , ) = correctedHeroContract.getCorrectedStats(_tokenIds[1]);
      (, , , , _unitTypesAuras[1][0], , _unitTypesAuras[1][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[1]);
    }
    if (_tokenIds[2] != 0) {
      _playRecord.unitClassIds[2] = heroContract.getHeroClassId(_tokenIds[2]);
      (_playRecord.unitLevels[2], _turnInfo.originalExps[2], _unitStats[2], , ) = correctedHeroContract.getCorrectedStats(_tokenIds[2]);
      (, , , , _unitTypesAuras[2][0], , _unitTypesAuras[2][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[2]);
    }
    if (_tokenIds[3] != 0) {
      _playRecord.unitClassIds[3] = heroContract.getHeroClassId(_tokenIds[3]);
      (_playRecord.unitLevels[3], _turnInfo.originalExps[3], _unitStats[3], , ) = correctedHeroContract.getCorrectedStats(_tokenIds[3]);
      (, , , , _unitTypesAuras[3][0], , _unitTypesAuras[3][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[3]);
    }
    // Retrieve enemy information.
    PlayRecord memory _enemyPlayRecord = addressToPlayRecord[_enemyAddress];
    if (_enemyPlayRecord.tokenIds[0] != 0) {
      _playRecord.unitClassIds[4] = heroContract.getHeroClassId(_enemyPlayRecord.tokenIds[0]);
      (_playRecord.unitLevels[4], , _unitStats[4], , ) = correctedHeroContract.getCorrectedStats(_enemyPlayRecord.tokenIds[0]);
      (, , , , _unitTypesAuras[4][0], , _unitTypesAuras[4][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[4]);
    }
    if (_enemyPlayRecord.tokenIds[1] != 0) {
      _playRecord.unitClassIds[5] = heroContract.getHeroClassId(_enemyPlayRecord.tokenIds[1]);
      (_playRecord.unitLevels[5], , _unitStats[5], , ) = correctedHeroContract.getCorrectedStats(_enemyPlayRecord.tokenIds[1]);
      (, , , , _unitTypesAuras[5][0], , _unitTypesAuras[5][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[5]);
    }
    if (_enemyPlayRecord.tokenIds[2] != 0) {
      _playRecord.unitClassIds[6] = heroContract.getHeroClassId(_enemyPlayRecord.tokenIds[2]);
      (_playRecord.unitLevels[6], , _unitStats[6], , ) = correctedHeroContract.getCorrectedStats(_enemyPlayRecord.tokenIds[2]);
      (, , , , _unitTypesAuras[6][0], , _unitTypesAuras[6][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[6]);
    }
    if (_enemyPlayRecord.tokenIds[3] != 0) {
      _playRecord.unitClassIds[7] = heroContract.getHeroClassId(_enemyPlayRecord.tokenIds[3]);
      (_playRecord.unitLevels[7], , _unitStats[7], , ) = correctedHeroContract.getCorrectedStats(_enemyPlayRecord.tokenIds[3]);
      (, , , , _unitTypesAuras[7][0], , _unitTypesAuras[7][1], , , ) = heroContract.getClassInfo(_playRecord.unitClassIds[7]);
    }
    // Additional token ids for enemies.
    // Unlike dungeons, arena needs IVs for the enemy heroes.
    _playRecord.tokenIds[4] = _enemyPlayRecord.tokenIds[0];
    _playRecord.tokenIds[5] = _enemyPlayRecord.tokenIds[1];
    _playRecord.tokenIds[6] = _enemyPlayRecord.tokenIds[2];
    _playRecord.tokenIds[7] = _enemyPlayRecord.tokenIds[3];
    // Step 2. Run the battle logic.
    // Firstly, we need to assign the unit's turn order with AGLs of the units.
    uint32[8] memory _unitAGLs;
    for (uint8 i = 0; i < 8; i ++) {
      _unitAGLs[i] = _unitStats[i][2];
    }
    _turnInfo.turnOrder = getOrder(_unitAGLs);
    // Fight for 24 turns. (8 units x 3 rounds.)
    _turnInfo.turnLength = 24;
    for (i = 0; i < 24; i ++) {
      if (_unitStats[4][4] == 0 && _unitStats[5][4] == 0 && _unitStats[6][4] == 0 && _unitStats[7][4] == 0) {
        _turnInfo.turnLength = i;
        break;
      } else if (_unitStats[0][4] == 0 && _unitStats[1][4] == 0 && _unitStats[2][4] == 0 && _unitStats[3][4] == 0) {
        _turnInfo.turnLength = i;
        break;
      }
      var _slotId = _turnInfo.turnOrder[(i % 8)];
      if (_slotId < 4 && _tokenIds[_slotId] == 0) {
        // This means the slot is empty.
        // Defender should be default value.
        _turnInfo.defenderList[i] = 127;
      } else if (_unitStats[_slotId][4] == 0) {
        // This means the unit on this slot is dead.
        // Defender should be default value.
        _turnInfo.defenderList[i] = 128;
      } else {
        // 1) Check number of attack targets that are alive.
        uint8 _targetSlotId = 255;
        if (_slotId < 4) {
          if (_unitStats[4][4] > 0)
            _targetSlotId = 4;
          else if (_unitStats[5][4] > 0)
            _targetSlotId = 5;
          else if (_unitStats[6][4] > 0)
            _targetSlotId = 6;
          else if (_unitStats[7][4] > 0)
            _targetSlotId = 7;
        } else {
          if (_unitStats[0][4] > 0)
            _targetSlotId = 0;
          else if (_unitStats[1][4] > 0)
            _targetSlotId = 1;
          else if (_unitStats[2][4] > 0)
            _targetSlotId = 2;
          else if (_unitStats[3][4] > 0)
            _targetSlotId = 3;
        }
        // Target is the defender.
        _turnInfo.defenderList[i] = _targetSlotId;
        // Base damage. (Attacker's ATK * 1.5 - Defender's DEF).
        uint32 _damage = 10;
        if ((_unitStats[_slotId][0] * 150 / 100) > _unitStats[_targetSlotId][1])
          _damage = max((_unitStats[_slotId][0] * 150 / 100) - _unitStats[_targetSlotId][1], 10);
        else
          _damage = 10;
        // Check miss / success.
        if ((_unitStats[_slotId][3] * 150 / 100) > _unitStats[_targetSlotId][2]) {
          if (min(max(((_unitStats[_slotId][3] * 150 / 100) - _unitStats[_targetSlotId][2]), 75), 99) <= random(100, 0))
            _damage = _damage * 0;
        }
        else {
          if (75 <= random(100, 0))
            _damage = _damage * 0;
        }
        // Is the attack critical?
        if (_unitStats[_slotId][3] > _unitStats[_targetSlotId][3]) {
          if (min(max((_unitStats[_slotId][3] - _unitStats[_targetSlotId][3]), 5), 75) > random(100, 0))
            _damage = _damage * 150 / 100;
        }
        else {
          if (5 > random(100, 0))
            _damage = _damage * 150 / 100;
        }
        // Is attacker has the advantageous Type?
        if (_unitTypesAuras[_slotId][0] == 0 && _unitTypesAuras[_targetSlotId][0] == 1) // Fighter > Rogue
          _damage = _damage * 125 / 100;
        else if (_unitTypesAuras[_slotId][0] == 1 && _unitTypesAuras[_targetSlotId][0] == 2) // Rogue > Mage
          _damage = _damage * 125 / 100;
        else if (_unitTypesAuras[_slotId][0] == 2 && _unitTypesAuras[_targetSlotId][0] == 0) // Mage > Fighter
          _damage = _damage * 125 / 100;
        // Is attacker has the advantageous Aura?
        if (_unitTypesAuras[_slotId][1] == 0 && _unitTypesAuras[_targetSlotId][1] == 1) // Water > Fire
          _damage = _damage * 150 / 100;
        else if (_unitTypesAuras[_slotId][1] == 1 && _unitTypesAuras[_targetSlotId][1] == 2) // Fire > Nature
          _damage = _damage * 150 / 100;
        else if (_unitTypesAuras[_slotId][1] == 2 && _unitTypesAuras[_targetSlotId][1] == 0) // Nature > Water
          _damage = _damage * 150 / 100;
        else if (_unitTypesAuras[_slotId][1] == 3 && _unitTypesAuras[_targetSlotId][1] == 4) // Light > Darkness
          _damage = _damage * 150 / 100;
        else if (_unitTypesAuras[_slotId][1] == 4 && _unitTypesAuras[_targetSlotId][1] == 3) // Darkness > Light
          _damage = _damage * 150 / 100;
        // Apply damage so that reduce hp of defender.
        if(_unitStats[_targetSlotId][4] > _damage)
          _unitStats[_targetSlotId][4] -= _damage;
        else
          _unitStats[_targetSlotId][4] = 0;
        // Save damage to play record.
        _turnInfo.damageList[i] = _damage;
      }
    }
    // Step 3. Apply the result of this battle.
    // Set heroes deployed.
    if (_tokenIds[0] != 0)
      heroContract.deploy(_tokenIds[0], locationId, coolHero);
    if (_tokenIds[1] != 0)
      heroContract.deploy(_tokenIds[1], locationId, coolHero);
    if (_tokenIds[2] != 0)
      heroContract.deploy(_tokenIds[2], locationId, coolHero);
    if (_tokenIds[3] != 0)
      heroContract.deploy(_tokenIds[3], locationId, coolHero);
    uint8 _deadHeroes = 0;
    uint8 _deadEnemies = 0;
    // Check result.
    if (_unitStats[0][4] == 0)
      _deadHeroes ++;
    if (_unitStats[1][4] == 0)
      _deadHeroes ++;
    if (_unitStats[2][4] == 0)
      _deadHeroes ++;
    if (_unitStats[3][4] == 0)
      _deadHeroes ++;
    if (_unitStats[4][4] == 0)
      _deadEnemies ++;
    if (_unitStats[5][4] == 0)
      _deadEnemies ++;
    if (_unitStats[6][4] == 0)
      _deadEnemies ++;
    if (_unitStats[7][4] == 0)
      _deadEnemies ++;
    if (_deadEnemies > _deadHeroes) { // Win
      // Fire TryArena event.
      TryArena(msg.sender, _enemyAddress, true);
      // Give reward.
      (_playRecord.expReward, _playRecord.goldReward) = giveReward(_tokenIds, true, _turnInfo.originalExps);
      // Save the record.
      recordContract.updateRecord(msg.sender, _enemyAddress, true);
    }
    else if (_deadEnemies < _deadHeroes) { // Lose
      // Fire TryArena event.
      TryArena(msg.sender, _enemyAddress, false);
      // Rewards.
      (_playRecord.expReward, _playRecord.goldReward) = giveReward(_tokenIds, false, _turnInfo.originalExps);
      // Save the record.
      recordContract.updateRecord(msg.sender, _enemyAddress, false);
    }
    else { // Draw
      // Fire TryArena event.
      TryArena(msg.sender, _enemyAddress, false);
      // Rewards.
      (_playRecord.expReward, _playRecord.goldReward) = giveReward(_tokenIds, false, _turnInfo.originalExps);
    }
    // Save the result of this gameplay.
    addressToPlayRecord[msg.sender] = _playRecord;
    // Save the turn data.
    // This is commented as this information can be reconstructed with intitial seed and date time.
    // By commenting this, we can reduce about 400k gas.
    if (isTurnDataSaved) {
      addressToTurnInfo[msg.sender] = _turnInfo;
    }
  }
}