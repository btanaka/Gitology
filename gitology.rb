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
# classy
#
class Gitology

  def chapter_to_string(chapter_name)
    # FIXME: address any security issues
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
  @content = gitology.chapter_to_string(@requested_chapter) # read file into a string
  haml :chapter
end
