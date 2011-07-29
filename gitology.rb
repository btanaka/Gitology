require 'rubygems'
require 'sinatra';



#
# constants
#
TITLE = "Gitology - A wealth of knowledge about Git"
BASEPATH = "." # base filesystem path
CHAPTERDIR = "chapters" # where the chapters live 
CHAPTEREXT = "mdwn"


#
# classy
#
class Gitology

  def initialize()
    @foo = "bar"
  end

  def foo
    # getter for foo
    return @foo
  end

  def chapter_to_string(chapter_name)
    @pathname = CHAPTERDIR + "/" + chapter_name + "." + CHAPTEREXT
    @chapter_contents = File.open("#{@pathname}", 'r') { |file| file.read }
    return @chapter_contents
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
  @content = gitology.chapter_to_string(@requested_chapter)
  # TODO: call object method here
  haml :chapter
end
