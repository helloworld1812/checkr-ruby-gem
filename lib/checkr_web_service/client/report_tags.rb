module CheckrWebService
  class Client
    module ReportTags
      def create_report_tag(report_id, data, options={})
        post "reports/#{report_id}/tags", data, options
      end

      def update_report_tags(report_id, options={})
        put "reports/#{report_id}/tags", data, options
      end

      def report_tags(report_id, options={})
        paginate "reports/#{report_id}/tags", options
      end

      def delete_report_tag(report_id, tag, options={})
        options[:query][:tag] = tag
        delete "reports/#{report_id}/tags", options
      end
    end
  end
end
