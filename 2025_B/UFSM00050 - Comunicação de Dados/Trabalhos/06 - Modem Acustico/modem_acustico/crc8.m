function crc = crc8(data)
    % data: vetor binário
    poly = [1 0 0 0 0 0 1 1 1]; % x^8 + x^2 + x + 1
    data = data(:)';            % força linha
    data = [data zeros(1, 8)];  % adiciona 8 bits 0 no final
    for i = 1:length(data) - 8
        if data(i) == 1
            data(i:i+8) = xor(data(i:i+8), poly);
        end
    end
    crc = data(end-7:end);
    disp(['CRC Data: ' num2str(crc)]);
end

