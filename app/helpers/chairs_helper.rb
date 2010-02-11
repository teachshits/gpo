module ChairsHelper
  def chair_abbr(chair)
    h "Кафедра #{chair.abbr}"
  end

  def chair_mentors(chair)
    out = ""
    unless chair.mentors.empty?
      out = chair.mentors.collect{|user| user.name}.to_sentence
    end
    out
  end
end
