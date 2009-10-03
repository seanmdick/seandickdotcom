
defaultedInput = function(target) {
  jQuery(target).bind("focus", function() {
    if (jQuery(this).val() == jQuery(this).attr("default_text")) {
      jQuery(this).val("").removeClass("error").removeClass("unselected");
    }
    jQuery(this).select();
  });
  jQuery(target).bind("blur", function() {
    if (jQuery(this).val() == "") {
      jQuery(this).val(jQuery(this).attr("default_text")).addClass("unselected");
    }
  });
}

refreshSong = function(song_id) {
    jQuery.ajax({
      url: "songs/" + song_id + ".widget",
      type: "GET",
      dataType: "text/html",
      success: function(data) {
        jQuery(".song[song_id=" + song_id + "]").html(jQuery(data).html());
      }
    });
}

jQuery(".editable").live("dblclick", function() {
  var self = jQuery(this);
  if(self.find("textarea").length < 1) {
    jQuery(this).html("<a class='save'>&#8730;</a><textarea>" + self.text() +"</textarea>");
  }
});

jQuery(".editable .save").live("click", function() {
  var version = jQuery(this).parents(".version");
  jQuery.ajax({
    type: "PUT",
    url: "versions/" + version.attr("version_id"),
    data: "song_version[description]=" + version.find("textarea").val().toString(),
    dataType: "json",
    success: function (data) {
      version.find(".editable").html(data.song_version.description);
    },
    error: function() {
      alert("there was a problem updating your description.")
    }
  })
  
});

jQuery(".add_song").live("click", function() {
  jQuery(this).before(jQuery("#pallette .song_form").html());
  defaultedInput(jQuery(".new_song:last"));
});

jQuery(".submit_song").live("click", function() {
  var title_field = jQuery(this).parent("form").find(".new_song");
  if(title_field.val() == title_field.attr("default_text")) {
    title_field.addClass("error");
  } else {
    jQuery.ajax({
      type: "POST",
      data: "song[title]=" + title_field.val(),
      dataType: "text/html",
      success: function(data) {
        jQuery(".songs").append(data);
        title_field.parent("form").remove();
      }
    })
  }
});

jQuery(".cancel").live("click", function() {
  jQuery(this).parents("form").remove();
});

jQuery(".expand_handle").live("click", function() {
  jQuery(this).parent().find(".versions_list").toggleClass("hidden");
});


jQuery(".version .delete_btn").live("click", function() {
  target = jQuery(this).parents(".version");
  if(confirm("Are you sure you want to delete this song?")) {
    jQuery.ajax({
      url: "versions/" + target.attr("version_id"),
      type: "delete",
      data: "a=1",
      success: function() {
        refreshSong(target.parents(".song").attr("song_id"));
      },
      error: function() {
        alert("an error occurred");
      }
    });
  }
});

jQuery(function() {
  jQuery(".songs .song").droppable({
    accept: '.version',
    addClasses: false,
    hoverClass: 'new_version',
    greedy: "true",
    drop: function(event, ui) {
      var song_id = jQuery(event.target).attr("song_id");
      var version_id = ui.draggable.attr("version_id");
      ui.draggable.draggable("option", "revert", "false");
      jQuery.ajax({
        type: "PUT",
        url: "/admin/songs/" + song_id + "/versions/" + version_id,
        data: "song_version[song_id]=" + song_id,
        success: function() {
          ui.draggable.hide("clip");
          refreshSong(song_id);
        },
        error: function() {
          alert("failure, please try again");
          ui.draggable.draggable("option", "revert", "true");
        }
      });
    }
  });
  
  defaultedInput(".find_song");
  jQuery(".find_song").bind("keydown", function(e) {
    var self = jQuery(this);
    if(e.which == 13) {
      jQuery.each(jQuery(".songs .song h3"), function() {
        if(jQuery(this).text().toLowerCase().match(self.val())) {
          jQuery(this).parents(".song").removeClass("hidden");
        } else {
          jQuery(this).parents(".song").addClass("hidden");
        }
        self.blur();
      });
    }
  });
  
  jQuery(".unattached .versions .version").draggable({
    revert: true,
    revertDuration: 300,
    delay: 250,
    handle: '.tiny_thumb, .version, .editable',
    scrollSensitivity: 100,
    cursorAt: {left: 5, top: 10}
  });
});