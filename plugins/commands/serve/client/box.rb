module VagrantPlugins
  module CommandServe
    class Client
      class Box < Client
        # @return [Bool] check allowed
        def automatic_update_check_allowed
          res = client.automatic_update_check_allowed(Empty.new)
          res.allowed
        end

        def destroy
          client.destroy(Empty.new)
        end

        # @param [String] version
        # @return [Bool] has update
        def has_update(version)
          res = client.has_update(SDK::Box::HasUpdateRequest.new(
            version: version
          ))
          res.has_update
        end

        # @param [Sdk::Args::TargetIndex] index
        # @return [Bool] is in use
        def in_use(index)
          res = client.in_use(index)
          res.in_use
        end

        # @param [String] path
        def repackage(path)
          path = Pathname.new(path.to_s)
          client.repackage(mapper.map(path, to: SDK::Args::Path))
        end

        # @return [String] path
        def directory
          res = client.directory(Empty.new)
          res.path
        end

        # @return [Hash<String, String>] metadata
        def metadata
          res = client.metadata(Empty.new)
          res.metadata
        end

        # @return [String] metadata url
        def metadata_url
          res = client.metadata_url(Empty.new)
          res.metadata_url
        end

        # @return [String] name
        def name
          res = client.name(Empty.new)
          res.name
        end

        # @return [String] provider
        def provider
          res = client.provider(Empty.new)
          res.provider
        end

        # @return [String] version
        def version
          res = client.version(Empty.new)
          res.version
        end

        # @param [Sdk::Args::Box] box
        # @return [int] version returns -1, 0, or 1 if this version is smaller,
        #               equal, or larger than the other version, respectively.
        def compare(box)
          res = client.compare(box)
          res.result
        end
      end
    end
  end
end
