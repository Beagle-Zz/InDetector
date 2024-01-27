contract c10164{
    // check dates
    modifier checkDateOrder {
      _ ;
      require ( dateMainStart < dateMainEnd ) ;
      require ( dateMainEnd < DATE_LIMIT ) ;
    }
}