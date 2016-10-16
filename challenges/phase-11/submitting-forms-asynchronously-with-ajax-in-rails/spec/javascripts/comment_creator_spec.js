describe("CommentCreator", function() {
  beforeEach(function() {
    jasmine.Ajax.install();
  });

  afterEach(function() {
    jasmine.Ajax.uninstall();
  });

  var attributes = {
    title: "Cinematic Gold!",
    content: "You have to see this.",
    video_id: "42"
  }

  var commentsSection = $("<div>", { "id": "comments" });

  var commentCreator = newCommentCreator(attributes, commentsSection);

  describe("new", function() {
    it("creates a new CommentCreator object", function() {
      expect(commentCreator).toBeDefined();
    });
  });

  describe("create", function() {
    it("issues a POST request to /api/v1/comments", function() {
      commentCreator.create();
      var request = jasmine.Ajax.requests.mostRecent();
      expect(request.method).toBe("POST");
      expect(request.url).toBe("/api/v1/comments");
    });

    it("calls the setFlash function", function() {
      spyOn(commentCreator, "setFlash");
      commentCreator.create();
      var request = jasmine.Ajax.requests.mostRecent();
      request.respondWith({ status: 201 });
      expect(commentCreator.setFlash).toHaveBeenCalled();
    });
  });

  describe("setFlash", function() {
    it("adds a new div to the body of the DOM", function() {
      commentCreator.setFlash("notice", "Hey there!");
      var flash = $("div.flash-notice")
      expect(flash.text()).toBe("Hey there!");
    });
  });

  describe("append", function() {
    it("adds the comment to the comment section", function() {
      commentCreator.append();
      expect(commentsSection.find("h3").text()).toBe("Cinematic Gold!");
      expect(commentsSection.find("p").text()).toBe("You have to see this.");
    });
  });
});
