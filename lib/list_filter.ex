require Integer

defmodule ListFilter do
  def call(list) do
    sum =
      Enum.flat_map_reduce(list, 0, fn
        elem, acc ->
          case Integer.parse(elem) do
            {num, _rest} ->
              if Integer.is_odd(num) do
                {[num], acc + num}
              else
                {[elem], acc}
              end

            :error ->
              {[elem], acc}
          end
      end)

    {_list, result} = sum
    result
  end
end
