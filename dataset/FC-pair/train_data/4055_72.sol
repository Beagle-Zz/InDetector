contract c4055{
  // @dev Define a new hero type (class).
  function defineType(string _className, uint8 _classRank, uint8 _classRace, uint32 _classAge, uint8 _classType, uint32 _maxLevel, uint8 _aura, uint32[5] _baseStats, uint32[5] _minIVForStats, uint32[5] _maxIVForStats)
    onlyOwner
    public
  {
    require(_classRank < 5);
    require(_classType < 3);
    require(_aura < 5);
    require(_minIVForStats[0] <= _maxIVForStats[0] && _minIVForStats[1] <= _maxIVForStats[1] && _minIVForStats[2] <= _maxIVForStats[2] && _minIVForStats[3] <= _maxIVForStats[3] && _minIVForStats[4] <= _maxIVForStats[4]);
    HeroClass memory _heroType = HeroClass({
      className: _className,
      classRank: _classRank,
      classRace: _classRace,
      classAge: _classAge,
      classType: _classType,
      maxLevel: _maxLevel,
      aura: _aura,
      baseStats: _baseStats,
      minIVForStats: _minIVForStats,
      maxIVForStats: _maxIVForStats,
      currentNumberOfInstancedHeroes: 0
    });
    // Save the hero class.
    heroClasses[numberOfHeroClasses] = _heroType;
    // Fire event.
    DefineType(msg.sender, numberOfHeroClasses, _heroType.className);
    // Increment number of hero classes.
    numberOfHeroClasses ++;
  }
}