# encoding: utf-8
class ChairAttestation < XlsReport
  attr_accessor :chair

  def initialize chair
    @chair = chair
  end

  def process_xml_template(xml)
    # меняем статический контент в шаблоне
    xml = xml.gsub("CHAIR_ABBR", @chair.abbr).
              gsub("SEMESTR", self.semestr).
              gsub("EDU_EAYR", self.edu_years).
              gsub("GPO_CHIEF", chair.mentors[0].initials_name).
              gsub("CHAIR_CHIEF", chair.chief).
              gsub("C_YEAR", self.c_year)
    # наполняем проектами
    document = REXML::Document.new(xml)
    table = document.elements["//table:table"]
    row = table.delete_element('//table:table-row[7]')
    formula_index = 7
    participant_index = 0
    chair.projects.active.each do |project|
      i = 1
      project.participants.active.each do |participant|
        tmp_row = row.deep_clone

        # deep_clone не всегда deep :(
        # поэтому используем этот хитрый хак, чтобы формулы прокопировались правильно
        tmp_row.elements[8].attributes.inspect
        tmp_row.elements[10].attributes.inspect
        tmp_row.elements[11].attributes.inspect

        if i == 1
          tmp_row.elements[1].add_attributes({"table:number-rows-spanned" => project.participants.active.size.to_s})
          tmp_row.elements[2].add_attributes({"table:number-rows-spanned" => project.participants.active.size.to_s})
          tmp_row.elements[3].add_attributes({"table:number-rows-spanned" => project.participants.active.size.to_s})
        end
        tmp_row.elements[1][1].text = "#{project.cipher} #{project.title} #{project.users.collect {|user| user.name}.join(", ")}"
        tmp_row.elements[4][1].text = i
        tmp_row.elements[5][1].text = participant.name
        tmp_row.elements[6][1].text = participant.course
        tmp_row.elements[7][1].text = participant.edu_group
        tmp_row.elements[8][1].text = participant.total_term_mark
        tmp_row.elements[8].attributes['value'].gsub!("0", participant.total_term_mark.to_s)


        tmp_row.elements[10].attributes["formula"].gsub!("7", formula_index.to_s)
        tmp_row.elements[11].attributes["formula"].gsub!("I7", "I#{formula_index.to_s}")
        tmp_row.elements[11].attributes["formula"].gsub!("J7", "J#{formula_index.to_s}")

        table.insert_after("//table:table-row[6+#{participant_index}]", tmp_row)
        participant_index += 1
        i += 1
        formula_index += 1
      end
    end
    document.to_s
  end

  def render_to_file(&block)
    super('chair_attestation', &block)
  end
end

