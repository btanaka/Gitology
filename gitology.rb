require 'rubygems'
require 'sinatra';



#
# constants
#
TITLE = "Gitology - A wealth of knowledge about Git"
BASEPATH = "." # base filesystem path
CHAPTERDIR = "chapters" # where the chapters live 
CHAPTEREXT = "mdwn" # markdown for the win

#
# chapter config
#
$chapter_list = [
  "branching-basics",
  "recipes",
  "about",
  "recipe-list-files-that-have-changed-between-two-revisions",
  "recipe-avoid-having-to-specify",
  "introduction"
  ]

#
# classy
#
class Gitology

  def chapter_to_string(chapter_name)
    # FIXME: address any security issues
    @pathname = CHAPTERDIR + "/" + chapter_name + "." + CHAPTEREXT
    @chapter_contents = File.open("#{@pathname}", 'r') { |file| file.read }
    return @chapter_contents
  end

  def make_fourohfour()
    @fourohfours = ["Gadzooks!",
      "Great Caesar's Ghost!",
      "Sad Trombone!",
      "Well this is awkward...",
      "Jinkies!"]
    @fourohfour = @fourohfours[rand(@fourohfours.length)]
    return @fourohfour
  end

end

gitology = Gitology.new



#
# default route at slash
#
get '/' do
  haml :index
end



#
# display a chapter
#
get '/chapter/:argument' do
  @requested_chapter = params[:argument]
  if ! $chapter_list.include?(@requested_chapter)
    @error = %[<div class="error">Error: Chapter not found.</div>]
    # TODO: pass this to index and make index display it if set
    haml :index
  else
    @content = gitology.chapter_to_string(@requested_chapter) # read file into a string
    haml :chapter
  end
end


#
# 404
#
not_found do
  @fourohfour = gitology.make_fourohfour
  haml :fourohfour
end

