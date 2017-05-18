"use strict";

var czyNopimyApp = new Vue({
  el: '#czyNopimyApp',
  data: {
    participants: ["Filip", "Janek", "Xu"],
    pastNops: [
      {
        date: '2016-01-03',
        participants: ["Filip", "Janek", "Xu"]
      },
      {
        date: '2016-01-02',
        participants: ["Xu"]
      },
      {
        date: '2016-01-01',
        participants: ["Janek", "Xu"]
      }
    ]
  },
  computed: {
    status: function() { return this.participants.length > 0 ? "Tak!" : "Nie."; }
  }
});
