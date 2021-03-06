import axios from "axios";
import {DetailEntity} from "../../types/models";

export class DetailService {

    static findAllBy(nameSto: string) {
        return axios.get<DetailEntity[]>("/api/detail/findAllBy", {
            params: {nameSto}
        })
            .then(res => res.data)
            .catch(() => [] as DetailEntity[])
    }

    static deleteBy(nameDetail: string, operationNumber: string) {
        return axios.post("/api/detail/delete", null, {
            params: {
                nameDetail,
                operationNumber
            }
        })
    }
}