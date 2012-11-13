class SearchRequest
  # annotations attribute should be a Hash object
  attr_accessor :rpp, :page, :source, :category, :location, :heading,
    :body, :text, :external_id, :start, :end, :annotations, :retvals

  def add_retval(retval)
    @retvals << retval
  end

  def query_params
    query = Hash.new
    url_params = ''
    if (rpp != nil)
      query[:rpp] = rpp.to_s;
      url_params += "rpp=#{CGI.escape(query[:rpp])}&"
    end
    if (page != nil)
      query[:page] = page.to_s;
      url_params += "page=#{CGI.escape(query[:page])}&"
    end
    if (source != nil)
      query[:source] = source.to_s;
      url_params += "source=#{CGI.escape(query[:source])}&"
    end
    if (category != nil)
      query[:category] = category.to_s;
      url_params += "category=#{CGI.escape(query[:category])}&"
    end
    if (location != nil)
      query[:location] = location.to_s;
      url_params += "location=#{CGI.escape(query[:location])}&"
    end
    if (heading != nil)
      query[:heading] = heading.to_s;
      url_params += "heading=#{CGI.escape(query[:heading])}&"
    end
    if (body != nil)
      query[:body] = body.to_s;
      url_params += "body=#{CGI.escape(query[:body])}&"
    end
    if (text != nil)
      query[:text] = text.to_s;
      url_params += "text=#{CGI.escape(query[:text])}&"
    end
    if (external_id != nil)
      query[:external_id] = external_id.to_s;
      url_params += "external_id=#{CGI.escape(query[:external_id])}&"
    end
    if (start != nil)
      query[:start] = start.to_s;
      url_params += "start=#{CGI.escape(query[:start])}&"
    end
    if (self.end != nil)
      query[:end] = self.end.to_s;
      url_params += "end=#{CGI.escape(query[:end])}&"
    end

    if (annotations != nil && annotations.size > 0)
      query[:annotations] = annotations
      url_params += "annotations=#{CGI.escape(ActiveSupport::JSON.encode(query[:annotations]))}&"
    end
    if (retvals != nil)
      query[:retvals] = retvals.join(',')  #queryParams.put("retvals", Utils.join(retvals));
      url_params += "retvals=#{CGI.escape(query[:retvals])}&"
    end
    
    url_params
  end
end
