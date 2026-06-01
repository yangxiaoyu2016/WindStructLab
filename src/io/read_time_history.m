function [data, header] = read_time_history(filename)
%READ_TIME_HISTORY Read a CSV time-history file.
%
% Purpose:
%   Read a comma-separated file with one header row and numeric data.
%
% Syntax:
%   [data, header] = read_time_history(filename)
%
% Inputs:
%   filename - Path to a CSV file. The first row contains column names.
%
% Outputs:
%   data   - Numeric matrix containing the CSV data.
%   header - Cell array of column names.
%
% Example:
%   [data, header] = read_time_history('sample_data/synthetic/synthetic_time_history.csv');
%   time = data(:, 1);
%   displacement = data(:, 2);
%
% Notes:
%   The first column is usually time in seconds for time-history data.
%   Remaining columns may contain displacement, velocity, acceleration,
%   force, or other response quantities. Units are not converted.

    if nargin ~= 1
        error('read_time_history requires exactly one input argument.');
    end

    if ~ischar(filename)
        error('filename must be a character array.');
    end

    if exist(filename, 'file') ~= 2
        error('File does not exist: %s', filename);
    end

    fid = fopen(filename, 'r');
    if fid < 0
        error('Could not open file: %s', filename);
    end

    cleanup_obj = onCleanup(@() fclose(fid));

    header_line = fgetl(fid);
    if ~ischar(header_line)
        error('CSV file is empty: %s', filename);
    end

    header = strsplit(header_line, ',');
    header = cellfun(@strtrim, header, 'UniformOutput', false);
    if isempty(header)
        error('CSV header row is empty: %s', filename);
    end

    format_spec = repmat('%f', 1, numel(header));
    values = textscan(fid, format_spec, 'Delimiter', ',', 'CollectOutput', true);
    data = values{1};

    if isempty(data)
        error('CSV file does not contain numeric data rows: %s', filename);
    end

    if size(data, 2) ~= numel(header)
        error('Number of numeric columns does not match header count.');
    end
end
