class Lesson < ActiveRecord::Base
  belongs_to :section
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, :with_same => :section_id
  

  def next_lesson
    #lookup the next lesson within its section. if there is none, it will produce the value nil. 
    lesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first

    return lesson
  end


end
