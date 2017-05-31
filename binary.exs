defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    to_charlist(string)
      |> validate_charlist
      |> Enum.reverse
      |> Enum.with_index
      |> Enum.reduce(0, fn (tuple, acc) -> convert_binary_digit(tuple, acc) end)
  end

  defp validate_charlist(charlist) do
    cond do
     Enum.all?(charlist, fn (v) -> v == ?1 || v ==?0 end) -> charlist
     true -> [?0]
    end
  end

  defp convert_binary_digit({?1, index}, acc) do
    acc + :math.pow(2, index)
  end

  defp convert_binary_digit(_tuple, acc), do: acc

end
