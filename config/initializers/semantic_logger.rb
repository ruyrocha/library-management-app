# frozen_string_literal: true

# Set the global default log level
SemanticLogger.default_level = :trace

# Log to a file, and use the colorized formatter
SemanticLogger.add_appender(file_name: "#{Rails.env}-semantic_logger.log", formatter: :color)
