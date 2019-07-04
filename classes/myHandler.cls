global class myHandler implements Messaging.InboundEmailHandler {
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          system.debug('test:: ' + email.plainTextBody);
          FeedItem oFeedItem = new FeedItem();
          oFeedItem.Body = email.plainTextBody + ' some text';
          insert oFeedItem;
          return result;
      }
  }