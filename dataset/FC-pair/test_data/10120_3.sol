contract c10120{
    // check dates
    modifier checkDateOrder {
      _ ;
      require ( dateMainStart < dateMainEnd ) ;
      require ( dateMainEnd < DATE_LIMIT ) ;
    }
}